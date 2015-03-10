From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the trivial tree
Date: Tue, 10 Mar 2015 16:34:17 +1100
Message-ID: <20150310163417.505f0da8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Li33Q3FNgmNADNawCw08fKz"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33398 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751271AbbCJFeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 10 Mar 2015 01:34:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan <gnomes@lxorguk.ukuu.org.uk>, Alan Cox <alan@linux.intel.com>

--Sig_/Li33Q3FNgmNADNawCw08fKz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

After merging the trivial tree, today's linux-next build ()
produced this warning:

drivers/tty/goldfish.c: In function 'goldfish_tty_probe':
drivers/tty/goldfish.c:232:6: warning: unused variable 'i' [-Wunused-variab=
le]
  int i;
      ^

Introduced by commit 2a2483685a9d ("goldfish: remove unreachable line
of code").

Also, the author email of that patch does not have a full name and does
not match any of the Signed-off-by lines :-(  (Yes, I know they are the
same person).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Li33Q3FNgmNADNawCw08fKz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/oJdAAoJEMDTa8Ir7ZwVHh4P/jbHN7GM+Jv0F6vh7khy7R8Z
SakTqCj19HD2NiDkQ6o0SlMFKQfK2i0B1BtYZ75Ty5hEfEXPSi0JjSAnhn0pixXe
1EqdWFXoT8RN5BHXSqsBXkgntmokqpC1t8tRuicHguL/dADhu+0HXpoQekAZn/zW
fGAsv7LJnoNsNPE/niNDEzMMiyJaU16qLLa9UYGSPkDN0fBGZoRKNSHaDVk/BcpW
44q5WQ3HnnL6Xlt37bCKJBJA4ctMDeenx34eS5h7OXHtHu3JWFkbCnFRXnVWu0yM
CXuNNdlWqDw8N2sqkUMhj/dqf1kQW2ZKc4kjh8FXTZKtND5aDLsRQgVKE7nMn8+O
c09Su7VA+uAkKJY4NkHZfEjAzC2SfpLJGwQxqvznOgar+glM6t8yxPLg1/ZByUWB
PXBTXuRYjSVd4CUcNVrb0100yMP4gBescSSaMB2IoA6Cn418XxKFxo/JU52plIWU
2P79PaYG38aCTtppfPA0d/oT2FaXaE3rMtPEHJKEEywbbkOjw5aBV8ffLVb0g/58
7Qdakjmoj426PvQHu80OgrGhW3Hwbml4JFfj+kEpFnQuQNY0J9qHL1gycjxXM58+
E162TkFpE7MjPwKAR2Fxc0IJCDKz1ueEwDBLWbO4KRcKxv0ue4dEvlpmeSfWPCJk
HuY8MWlQdx9PqY0L+XbU
=6JRM
-----END PGP SIGNATURE-----

--Sig_/Li33Q3FNgmNADNawCw08fKz--
