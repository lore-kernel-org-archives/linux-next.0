From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Thu, 18 Oct 2018 21:54:03 -0700
Message-ID: <1539924843.18970.35.camel@HansenPartnership.com>
References: <20181019155034.2cf7f864@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-t6+FJjiqLsyK2mQ5G4Ul"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019155034.2cf7f864@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org


--=-t6+FJjiqLsyK2mQ5G4Ul
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-10-19 at 15:50 +1100, Stephen Rothwell wrote:
> Hi James,
>=20
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> drivers/scsi/lpfc/lpfc_debugfs.c: In function
> 'lpfc_debugfs_nodelist_open':
> drivers/scsi/lpfc/lpfc_debugfs.c:706:17: warning: 'nrport' may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    switch (nrport->port_state) {
>            ~~~~~~^~~~~~~~~~~~
> drivers/scsi/lpfc/lpfc_debugfs.c:553:30: note: 'nrport' was declared
> here
>   struct nvme_fc_remote_port *nrport;
>                               ^~~~~~
>=20
> I am not sure where this has come from :-(

It's the merge commit ... it was obviously the wrong choice; I'll fix
it.

James

--=-t6+FJjiqLsyK2mQ5G4Ul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCW8ljawAKCRDnQslM7pis
hY0SAQC+UTjH/MHC0MlO40CsXZOqqa57+sxS9ALQaJ1uU72HaQD8DvXRaqc85GQf
3efCPD1vS0dideELBA/zVCBOgSSvmwk=
=bgKI
-----END PGP SIGNATURE-----

--=-t6+FJjiqLsyK2mQ5G4Ul--
