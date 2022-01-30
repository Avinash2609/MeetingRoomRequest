package com.problemstatement.Team11.repository;

import com.problemstatement.Team11.model.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RequestRepo extends JpaRepository<Request,Integer> {
    List<Request> findByEmail(String email);

    @Query("from Request where location=?1 and status=?2")
    List<Request> findByLocationStatus(String location,String status);
}
