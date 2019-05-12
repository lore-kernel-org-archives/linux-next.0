From: Carlo Pisani <carlojpisani@gmail.com>
Subject: Re: C3600, sata controller
Date: Sun, 12 May 2019 22:49:18 +0200
Message-ID: <CA+QBN9BcrrgT-ThOMwSjugTVRqoU10d8juOibLMMROvWvJqd4g@mail.gmail.com>
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Parisc List <linux-parisc@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

kernel's config and dmesg are here

http://www.downthebunker.com/chunk_of/stuff/public/projects/workstations/hppa/c3600/kernel/5.1-git-v5.2-64bit/

http://www.downthebunker.com/chunk_of/stuff/public/projects/workstations/hppa/c3600/kernel/4.16.2-64bit/

Il giorno dom 12 mag 2019 alle ore 22:44 Carlo Pisani
<carlojpisani@gmail.com> ha scritto:
>
> guys,
> I asked a friend to lend us his card, which is the card2 listed below
> and not things are becoming really weird
>
> card1, Silicon Image, Inc. Adaptec AAR-1210SA
> card2, Silicon Image, Inc. SiI 3124 PCI-X Serial ATA
>
> the card1 is a PCI32 bit card, and uses the "sata_sil" driver
> the card2 is a PCI64 bit card, and uses the "sata_sil24" driver
>
> card1 is installed in a PCI32 slot, and it's moving 32Gbyte in a loop
> without any issue
>
> I have just tested card2 in each of the PCI-X slot (including the 3.3V
> one) and ... it has always triggered the HPMC unit, crashing the
> machine
>
> the hardware is different, and drivers are also different, but  ....
> maybe the problem is related to 32 vs 64bit?
>
> I am going to repeat the test with card2 installed in a PCI32 slot.
> This should force it to 32bit: will it work correctly?
> (hope this makes sense)
>
> ---
>
> we have also checked if the kernel is correctly handling the ram
> we have a C3600 with 8Gbyte of ram
>
> mount -t tmpfs -o size=7G tmpfs /mnt/ramdrive/
> dd if=/dev/zero of=/mnt/ramdrive/test.bin
> badblocks -swv /mnt/ramdrive/test.bin
>
> checking for bad blocks in read-write mode
> From block 0 to 7340031
> Testing with pattern 0xaa: done
> Reading and comparing: done
> Testing with pattern 0x55: done
> Reading and comparing: done
> Testing with pattern 0xff: done
> Reading and comparing: done
> Testing with pattern 0x00: done
> Reading and comparing: done
> Pass completed, 0 bad blocks found.
>
> no problems found
