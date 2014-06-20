From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: randconfig build error with next-20140620, in
 drivers/thunderbolt/nhi.c
Date: Fri, 20 Jun 2014 09:47:09 -0700
Message-ID: <20140620164709.GA5043@kroah.com>
References: <CA+r1ZhjD7qvOKedKAUGMmoVL1BPHW545O1QdxBCqQkvZNt9Npg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+r1ZhjD7qvOKedKAUGMmoVL1BPHW545O1QdxBCqQkvZNt9Npg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, andreas.noever@gmail.com
List-Id: linux-next.vger.kernel.org

On Fri, Jun 20, 2014 at 07:03:44AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
>=20
> drivers/thunderbolt/nhi.c: In function =E2=80=98nhi_probe=E2=80=99:
> drivers/thunderbolt/nhi.c:541:2: error: implicit declaration of
> function =E2=80=98pcim_enable_device=E2=80=99 [-Werror=3Dimplicit-fun=
ction-declaration]
>   res =3D pcim_enable_device(pdev);
>   ^
> drivers/thunderbolt/nhi.c:547:2: error: implicit declaration of
> function =E2=80=98pci_enable_msi=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>   res =3D pci_enable_msi(pdev);
>   ^
> cc1: some warnings being treated as errors
> make[2]: *** [drivers/thunderbolt/nhi.o] Error 1

A patch was just sent to fix this, will be in the next linux-next
release, thanks.

greg k-h
