package com.example.petty.controllers;
import com.example.petty.models.Pet;
import com.example.petty.models.User;
import com.example.petty.services.PetService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;


@Slf4j
@Controller
@RequiredArgsConstructor
public class RequestController {
    private final PetService petService;

    @GetMapping("/")
    public String pets(@RequestParam(name = "name", required = false) String name,Principal principal, @NotNull Model model){
        User user = petService.getUserByPrincipal(principal);
        model.addAttribute("pets", petService.petList(name, user));
        model.addAttribute("user", petService.getUserByPrincipal(principal));
        return "pets";
    }

    @GetMapping("/pet/{id}")
    public String petInfo(@PathVariable Long id, @NotNull Model model){
        Pet pet = petService.getPetById(id);
        model.addAttribute("pet", pet);
        model.addAttribute("images", pet.getImages());
        return "pet-info";
    }

    @PostMapping("/product/create")
    public String createPet(@RequestParam("file1") MultipartFile file1, Pet pet, Principal principal) throws IOException {
        petService.savePet(principal, pet, file1);
        return "redirect:/";
    }

    @PostMapping("/pet/delete/{id}")
    public String deletePet(@PathVariable Long id){
        petService.deletePet(id);
        return "redirect:/";
    }


}
