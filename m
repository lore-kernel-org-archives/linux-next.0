From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] s390: fix tlb_gather_mmu fallout
Date: Thu, 22 Aug 2013 10:02:01 +1000
Message-ID: <20130822100201.f671d39da9dc638b759a9bbb@canb.auug.org.au>
References: <20130821151233.GA19384@osiris>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__22_Aug_2013_10_02_01_+1000_Cr8h/BPZ6nv0uJUs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:36865 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753076Ab3HVACE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Aug 2013 20:02:04 -0400
In-Reply-To: <20130821151233.GA19384@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-next@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@redhat.com>

--Signature=_Thu__22_Aug_2013_10_02_01_+1000_Cr8h/BPZ6nv0uJUs
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Wed, 21 Aug 2013 17:12:33 +0200 Heiko Carstens <heiko.carstens@de.ibm.co=
m> wrote:
>
> could you please add the compile fix below to linux-next?

I will add it to the kvm tree merge from today.

cc'd the kvm tree maintainers as one they will need to tell Linus about
this semantic conflict when they ask him to pull their tree.

[Patch recreated below for reference]

From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Wed, 21 Aug 2013 16:46:25 +0200
Subject: [PATCH] s390: fix tlb_gather_mmu fallout

With commit 2b047252 "Fix TLB gather virtual address range invalidation
corner cases" tlb_gather_mmu() got a new argument.
There is however a patch in the kvm/linux-next tree "KVM: s390: allow sie
enablement for multi-threaded programs" which now causes breakage in
linux-next:

arch/s390/mm/pgtable.c: In function =E2=80=98s390_enable_sie=E2=80=99:
arch/s390/mm/pgtable.c:1175:2: error: too few arguments to function =E2=80=
=98tlb_gather_mmu=E2=80=99

So let's fix just this.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index ef34519..8a123da 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -1172,7 +1172,7 @@ int s390_enable_sie(void)
 	thp_split_mm(mm);
 	/* Reallocate the page tables with pgstes */
 	mm->context.has_pgste =3D 1;
-	tlb_gather_mmu(&tlb, mm, 0);
+	tlb_gather_mmu(&tlb, mm, 0, TASK_SIZE);
 	page_table_realloc(&tlb, mm, 0, TASK_SIZE);
 	tlb_finish_mmu(&tlb, 0, -1);
 	up_write(&mm->mmap_sem);
--=20
1.8.2.3

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__22_Aug_2013_10_02_01_+1000_Cr8h/BPZ6nv0uJUs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSFVT5AAoJEECxmPOUX5FEnpkP/04t14/Kgdn2CaxIPLsdrQfI
MYht+pYSTICIAjiYZqLx22+hOukH2RP1fIgmUltc4pBtT1tQENMeoCDKD8+3/TMe
gK27k460MhuO2hqtie2Sir5lEBWZj6tKVdvW98zvFO25hSJgSLrQ2mwcliB5cMtL
NJIvQVL3GncL6IgLFlPV2o1Rul6WwxHx/t4sMeXe4nNi9BQejffk9ppRajoWIuzj
FNbZPoFMFs8DQ3Rn2SYOKrNzuG3Z9ltpOc0esmstp6PHUtZmVrrHzktziVhh4kk8
jH0mzKIU+XeLMd5lQ32l5zM/P3hAqY6JN7OyNcqBYaLCBjj8KbOgD6zONMyseW0o
yxLhKokMJfzh3OFMlp5VKBqeHTWiJ041Df10hSKul390h9frKv9x5bJw5JElbBZE
U2xZPgIotMQWTAI4WAHF6aawsNYFtSqEzE+yk+RxWPA/jjsAB70mqKMIT3BvNClM
8yIN/k7V/iLUmnQMxKGJGWQNXm0aExUI1Y1RMPyaarhGi4un2PVXV3P0WKlPDNi0
OC5ueaz0jEK0ovzNNo7ksgLz5uTMC4bxEl7w+WFG6CvdMQZ7/lddRdrd9Nogfa40
8SDSXYtpORmlG79+lTUz6ysMcCc2P2wTRsK2Vhu7D4Fi7UP03KrxjcgXv/9B0FIn
nqtpkOGhZEYOeewGaw7G
=b3y6
-----END PGP SIGNATURE-----

--Signature=_Thu__22_Aug_2013_10_02_01_+1000_Cr8h/BPZ6nv0uJUs--
