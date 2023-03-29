package com.example.petty.services;

import com.example.petty.models.Pet;
import com.example.petty.models.User;
import com.example.petty.repositories.PetRepository;
import com.example.petty.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class PetService {
    private final PetRepository petRepository;
    private final UserRepository userRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public List<Pet> petList(String name, User user) {
        if (name != null) return petRepository.findByUserAndNameStartingWith(user, name);
        return petRepository.findByUser(user);
    }

    public void savePet(Principal principal, Pet pet, MultipartFile file) throws IOException {
        pet.setUser(getUserByPrincipal(principal));

        if (file != null){
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath +"/"+ resultFilename));
            pet.setFilename(resultFilename);
        }
        log.info("Adding new Pet. Name: {}", pet.getName());
        petRepository.save(pet);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deletePet(Long id){
        petRepository.deleteById(id);
    }

    public Pet getPetById(Long id) {
        return petRepository.findById(id).orElse(null);
    }
}
