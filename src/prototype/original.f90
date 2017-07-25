program main
  use mpi
  implicit none
  integer :: ierror,size,rank

  call MPI_Init(ierror)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
  call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)

  print *,"Hello, world!"

  call MPI_FINALIZE(ierror)
end program
