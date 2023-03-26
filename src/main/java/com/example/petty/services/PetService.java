package com.example.petty.services;

import com.example.petty.models.Image;
import com.example.petty.models.Pet;
import com.example.petty.models.User;
import com.example.petty.repositories.PetRepository;
import com.example.petty.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class PetService {
    private final PetRepository petRepository;
    private final UserRepository userRepository;
    public List<Pet> petList(String name, User user) {
        if (name != null) return petRepository.findByUserAndNameStartingWith(user, name);
        return petRepository.findByUser(user);
    }

    public void savePet(Principal principal, Pet pet, MultipartFile file1) throws IOException {
        pet.setUser(getUserByPrincipal(principal));
        Image image1;
        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            pet.addImageToPet(image1);
            Pet petFromDb = petRepository.save(pet);
            petFromDb.setPreviewImageId(petFromDb.getImages().get(0).getId());
        }
        log.info("Adding new Pet. Name: {}", pet.getName());

        petRepository.save(pet);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException{
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
    public void deletePet(Long id){
        petRepository.deleteById(id);
    }

    public Pet getPetById(Long id) {
        return petRepository.findById(id).orElse(null);
    }
}
