program main
    implicit none
    integer, dimension(100000) :: A = 0, B = 0
    integer :: ak, bk
    integer :: ai = 0, bi = 0
    integer :: ae = 1, be = 1
    integer :: av, bv
    integer :: delta
    integer :: iostat
    integer :: total = 0
    integer :: i
    character(256) :: file_name
    integer :: length
    call get_command_argument(1, length = length, status = iostat, value=file_name)
    if (iostat /= 0) then
        stop
    end if
    open(unit=0, file=file_name, iostat=iostat)
    do while (iostat == 0)
        read (0, "(2(I8))", iostat=iostat) ak, bk
        if (iostat /= 0) then
            exit
        end if
        A(ak) = A(ak) + 1
        B(bk) = B(bk) + 1
        ai = min(ai, ak)
        ae = max(ae, ak)
        be = max(be, bk)
        bi = min(bi, bk)
    end do
    ! Part 2
    print *, dot_product([(i, i = 1, 100000)], A * B)
    do while (ai <= ae)
        av = A(ai)
        do while (av /= 0)
            bv = B(bi)
            delta = min(av, bv)
            total = total + delta * abs(bi - ai)
            av = av - delta
            bv = bv - delta
            A(ai) = av
            B(bi) = bv
            if (bv == 0) then
                bi = bi + 1
            end if
        end do
        if (av == 0) then
            ai = ai + 1 
        end if
    end do
    ! Part 1
    print *, total
end program main
