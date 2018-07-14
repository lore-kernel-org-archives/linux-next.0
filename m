From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next-20180711][Oops] linux-next kernel boot is broken on
 powerpc
Date: Sat, 14 Jul 2018 10:55:00 +1000
Message-ID: <20180714105500.3694b93f@canb.auug.org.au>
References: <1531416305.6480.24.camel@abdul.in.ibm.com>
        <CAGM2rebtisZda0kqhg0u92fTDxC+=zMNNgKFBLH38osphk0fdA@mail.gmail.com>
        <1531473191.6480.26.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h9o4dxATHYTD+EgczYGdc_="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531473191.6480.26.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, sachinp@linux.vnet.ibm.com, Michal Hocko <mhocko@suse.com>, sim@linux.vnet.ibm.com, venkatb3@in.ibm.com, LKML <linux-kernel@vger.kernel.org>, manvanth@linux.vnet.ibm.com, Linux Memory Management List <linux-mm@kvack.org>, linux-next@vger.kernel.org, aneesh.kumar@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

--Sig_/h9o4dxATHYTD+EgczYGdc_=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Abdul,

On Fri, 13 Jul 2018 14:43:11 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.co=
m> wrote:
>
> On Thu, 2018-07-12 at 13:44 -0400, Pavel Tatashin wrote:
> > > Related commit could be one of below ? I see lots of patches related =
to mm and could not bisect
> > >
> > > 5479976fda7d3ab23ba0a4eb4d60b296eb88b866 mm: page_alloc: restore memb=
lock_next_valid_pfn() on arm/arm64
> > > 41619b27b5696e7e5ef76d9c692dd7342c1ad7eb mm-drop-vm_bug_on-from-__get=
_free_pages-fix
> > > 531bbe6bd2721f4b66cdb0f5cf5ac14612fa1419 mm: drop VM_BUG_ON from __ge=
t_free_pages
> > > 479350dd1a35f8bfb2534697e5ca68ee8a6e8dea mm, page_alloc: actually ign=
ore mempolicies for high priority allocations
> > > 088018f6fe571444caaeb16e84c9f24f22dfc8b0 mm: skip invalid pages block=
 at a time in zero_resv_unresv() =20
> >=20
> > Looks like:
> > 0ba29a108979 mm/sparse: Remove CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER
> >=20
> > This patch is going to be reverted from linux-next. Abdul, please
> > verify that issue is gone once  you revert this patch. =20
>=20
> kernel booted fine when the above patch is reverted.

And it has been removed from linux-next as of next-20180713.  (Friday
the 13th is not all bad :-))
--=20
Cheers,
Stephen Rothwell

--Sig_/h9o4dxATHYTD+EgczYGdc_=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltJSeQACgkQAVBC80lX
0GzEPgf+O8ZUulbaRgniWzhnLUmbpQm5/OWeEsLqXQOjU5/rHCoshZNJPaIJyJZJ
bBApGslZMfVpOqFwXAg0AyP3RHJwShjMaT/Et+9w7Q2UhxXV5DgPItJ9hvAmOBMk
9UvmL2gPbZ7UNMZQVnxpnSsPVMj9RWp5nNG59ANcgV8skYN/nPEEju/DtJ+QJFN/
utSHrk2BXD2juj1xgqQhAd8FGB0eRLFvWUFzMgLXWnl7ErTySkMSYYVYGtY9UBWN
RuKT/pMD/V6/DdJKLMODs9yQaPeP7s9pFAgXzYeqwxxcqfllxbCr6xhyP3po64kp
iDtz6xVa4SjoyUiR90n3DIPkbAHV2Q==
=mqb2
-----END PGP SIGNATURE-----

--Sig_/h9o4dxATHYTD+EgczYGdc_=--
