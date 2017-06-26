From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Tue, 27 Jun 2017 07:57:40 +0800
Message-ID: <20170626235740.GF53180@WeideMacBook-Pro.local>
References: <20170626163012.67294296@canb.auug.org.au>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34705 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751440AbdFZX5n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2017 19:57:43 -0400
Content-Disposition: inline
In-Reply-To: <20170626163012.67294296@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks, I just found it.=20

On Mon, Jun 26, 2017 at 04:30:12PM +1000, Stephen Rothwell wrote:
>Hi Andrew,
>
>After merging the akpm tree, today's linux-next build (x86_64
>allmodconfig) produced this warning:
>
>mm/memory_hotplug.c: In function 'move_pfn_range_to_zone':
>mm/memory_hotplug.c:891:16: warning: unused variable 'i' [-Wunused-variabl=
e]
>  unsigned long i;
>                ^
>
>Introduced by commit
>
>  7fb537987bb3 ("mm/memory_hotplug: remove duplicate call for set_page_lin=
ks")
>
>--=20
>Cheers,
>Stephen Rothwell

--=20
Wei Yang
Help you, Help me

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZUZ90AAoJEKcLNpZP5cTdNV4QALOCyDXCvCwPUxTA2Z9ozKj+
ukYfpUx2Z6Ol5uiB3ZVr+dqnZXCDhtxQfknuo7ffB8AXRvTIhv5xlGnQembwMsVi
VRxMtu3MCjGZIOk4t761BYVTxl0zkOLM+pLKjXMkfvcwc/5C5hPgpzamvUVjmb8b
XyWaFLuuiXSqy8+6kd+V0GGc29+PZ2tCelzDu74g4RtjxC3QHivMbjtoECBGFoq3
ACMLN418A1AvRAUPJjKN5yLLqM23jQy1WnV6nX9xmrX4W3YZyhZHip1KeDna/cOO
d8Jx97xORD1AgY408zyY9bLiwMk6oF7PpbjbCW3g/LE7uveA7KbpShxjhmbbwde5
osOoUf7p+OTHub9pKsajm7nzBEKu+kXK9NzKaIj+DvTIKrKrHBYHqjQ8Zat/nQee
ZJcHLKwTWoF07Rwx9bcpCVQdfdvQOuYTCqL6uETpS0rmRsmpdnLg0n3+sZ+VILau
QO7mdlxAXLijjE5sC1+tJw3JIAmTAr8Y2Ax/sFKk6T87Fak3itzTOUHAGdxTybZ2
OCIrXNH1d8oUSj92UYd3IyaeyL5/3hc+vdjvsmMf21pyGoUIRw7I6nLD8rbu28X7
Nw5XNcLTM4lB1yFqp92eCFQXG+KWDKPnk1Gx32QuuEq5HmhWv7pVNZMQI6PwadCi
1n6GYpSgyPONxOPr/Dbx
=/lDn
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--
