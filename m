From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: randconfig build error with next-20131115, in drivers/pci/hotplug
Date: Fri, 15 Nov 2013 09:08:53 -0700
Message-ID: <CAErSpo5dhJRMcg7RMKNAQoE5ELeby2ULKFUhw2ncyaML8-+jvw@mail.gmail.com>
References: <CA+r1ZhiPW29tUDYNyEt36jWgYKpt1tXALRGVzrOza5X+J+awXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhiPW29tUDYNyEt36jWgYKpt1tXALRGVzrOza5X+J+awXA@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next list <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 15, 2013 at 9:08 AM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> In file included from drivers/pci/hotplug/cpqphp_core.c:45:0:
> drivers/pci/hotplug/cpqphp.h:204:2: error: redeclaration of enumerato=
r
> =91NUMBER_OF_ENTRIES=92
>   NUMBER_OF_ENTRIES =3D offsetof(struct hrt, number_of_entries),
>   ^
> drivers/pci/hotplug/cpqphp.h:118:2: note: previous definition of
> =91NUMBER_OF_ENTRIES=92 was here
>   NUMBER_OF_ENTRIES =3D offsetof(struct smbios_entry_point, number_of=
_entries),
>   ^
>   CC      drivers/mtd/maps/physmap.o
> make[3]: *** [drivers/pci/hotplug/cpqphp_core.o] Error 1

I fixed this and repushed my "for-linus" branch, thanks.

Bjorn
