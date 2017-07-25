program new_main

  use iso_fortran_env, only : team_type

  use opencoarrays, only : my_communicator

  type(team_type) :: member
  type(stuff) :: my_initial_data

  ! Use all images to compute the initial data
  my_initial_data = initializer(my_communicator(member))

  form team(my_team(),member)

  change team(member)

    ! Every image now has my_initial_data

    call original_main(my_communicator(member))

  end team

contains

  function my_team() result(team_id)
    !! Return the ultimate team number for this image
    integer :: team_id
  end function

  subroutine initializer(communicator)
     integer, intent(in) :: communicator
     !! compute the initial data for the given image,
     !! accounting for the mapping from the global calculation (using all images)
     !! to the partitioned computation (using a collection of independent teams)

  end subroutine

  subroutine original_main(communicator)
    !program main
    use mpi
    implicit none
    integer, intent(in) :: communicator
    integer :: ierror,size,rank

   !call MPI_Init(ierror)
    call MPI_COMM_SIZE(communicator, size, ierror)
    call MPI_COMM_RANK(communicator, rank, ierror)

    print *,"Hello, world from rank ",rank," of ",size

   !call MPI_FINALIZE(ierror)
    !end program
  end subroutine

end program
