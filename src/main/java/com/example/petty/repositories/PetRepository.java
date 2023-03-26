package com.example.petty.repositories;

import com.example.petty.models.Pet;
import com.example.petty.models.User;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;

public interface PetRepository extends JpaRepository<Pet, Long> {
    List<Pet> findByUser(User user);

    List<Pet> findByUserAndNameStartingWith(User user, String name);
}
