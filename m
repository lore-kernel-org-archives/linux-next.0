From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 16 Apr 2014 15:19:56 +1000
Message-ID: <20140416151956.b3388ef9c11c6c58b535186f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__16_Apr_2014_15_19_56_+1000_d+RjUBV934JWIEmq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__16_Apr_2014_15_19_56_+1000_d+RjUBV934JWIEmq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from mm/vmscan.c:50:0:
include/linux/swapops.h: In function 'is_swap_pte':
include/linux/swapops.h:57:2: error: implicit declaration of function 'pte_=
present_nonuma' [-Werror=3Dimplicit-function-declaration]
  return !pte_none(pte) && !pte_present_nonuma(pte) && !pte_file(pte);
  ^

Caused by commit 851fe3337768 ("x86: define _PAGE_NUMA by reusing
software bits on the PMD and PTE levels").  This build does not have
CONFIG_NUMA_BALANCING set.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__16_Apr_2014_15_19_56_+1000_d+RjUBV934JWIEmq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCAAGBQJTThMAAAoJEMDTa8Ir7ZwVnvoP/i+0jZ8B29183MPtalq8jFie
hvbY1YyTyVjlWiJIDD+CwwcjyiXWOhXw4fEwOSNrCRcWyjtlidzcyIwHqAmapmPe
7k0M6xrzZB1+qJQC/heA8jacZxU2PzHemm0nj+rwXNPWnfdCATmR6R2O6kM99kdS
cjXCYNhR7IKapqSpYDT3qjWN85rVc3c4dm6/H8TDKFlQTyhSXOooetybaNflhEHX
nXqykprFQgYgPXWB+nzgJH7LRPkNKWAoCD4x9+TPhGILNEW0f6JEvf1FJOU+4Z6W
uwIr2lQDR8sJotwu2RLX/naBvJFt2qW0AR6U+ah0DYFOLA9oZMiY5Xprg4EpyRgJ
1FgDlQ+W6psv3113qcZ9L6W6wkNxt/BO3HNEDpCeCaVHzHGKdWWCwm2Isl6nGRQW
15ojTPFc5N5IUh7oZJLWlP3DM4CDPRgbaEWQev6pwPE52OMKmue3APx6sbjnfaJc
GcxS9PRO/226GrqnCMqu4l5+WE/QYXO1v1niy0wNUOMLDDj0a1JBwjmfVYo3qh1w
EzCnLJgxfcxHzKWrDg13qVhNQMPS6E4VeBxEdm4iJA5+DuzZT8X2Dn0zXrcmEAGV
XDsmRiqRGnrxKy9IIvPjEptBI+rhz7nTEXF3aY9/jecjeajn001zYpwLmPKIaVUL
xkPfjDhC+fQMCHqyIno6
=GFDq
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Apr_2014_15_19_56_+1000_d+RjUBV934JWIEmq--
