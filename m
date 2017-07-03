From: Kamil Rytarowski <n54@gmx.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the kbuild tree
Date: Mon, 3 Jul 2017 18:43:32 +0200
Message-ID: <054dc72a-39ce-ee8c-62d1-c17f487009de@gmx.com>
References: <20170626111331.5443587b@canb.auug.org.au>
 <20170703125859.0678914b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GMfQrbd2Hp2IBUu6FxPbGpC6VCvSJa4iP"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:58751 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932166AbdGCQlV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 12:41:21 -0400
In-Reply-To: <20170703125859.0678914b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GMfQrbd2Hp2IBUu6FxPbGpC6VCvSJa4iP
Content-Type: multipart/mixed; boundary="xnsQVpoVNsUhonTaq4xVmfFQUbG3sGJUT";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet
 <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <054dc72a-39ce-ee8c-62d1-c17f487009de@gmx.com>
Subject: Re: linux-next: manual merge of the jc_docs tree with the kbuild tree
References: <20170626111331.5443587b@canb.auug.org.au>
 <20170703125859.0678914b@canb.auug.org.au>
In-Reply-To: <20170703125859.0678914b@canb.auug.org.au>

--xnsQVpoVNsUhonTaq4xVmfFQUbG3sGJUT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

Am I expected to do it myself and resend a new patch?

On 03.07.2017 04:58, Stephen Rothwell wrote:
> Hi all,
>=20
> With the merge window opening, just a reminder that this conflict still=

> exists.
>=20
> On Mon, 26 Jun 2017 11:13:31 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> Today's linux-next merge of the jc_docs tree got a conflict in:
>>
>>   scripts/kernel-doc-xml-ref
>>
>> between commit:
>>
>>   cb77f0d623ff ("scripts: Switch to more portable Perl shebang")
>>
>> from the kbuild tree and commit:
>>
>>   52b3f239bb69 ("Docs: clean up some DocBook loose ends")
>>
>> from the jc_docs tree.
>>
>> I fixed it up (the latter removed the file, so I did that) and can
>> carry the fix as necessary. This is now fixed as far as linux-next is
>> concerned, but any non trivial conflicts should be mentioned to your
>> upstream maintainer when your tree is submitted for merging.  You may
>> also want to consider cooperating with the maintainer of the conflicti=
ng
>> tree to minimise any particularly complex conflicts.
>=20



--xnsQVpoVNsUhonTaq4xVmfFQUbG3sGJUT--

--GMfQrbd2Hp2IBUu6FxPbGpC6VCvSJa4iP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZWnQ0AAoJEEuzCOmwLnZsUDkP/jd8a3ahwGKjziSLFDcyeh9y
RmiC/1mvmyJs9z2aqUzXTc4AWK40M6toSlhcZxaLyhOd6KEoCqpm3PyV2AdT3r1y
VE4R178li56eZbdfIDtZ41w9oRfuBcrb4z4oqUtXOzh5gy91eLDiAUaWZzoOP4cN
Z8nA75y1xUGIFItYT/aUlPYNX/5A19CVPTF5+5k+H8ROx14l+GsHw8L5Fdh59nta
7aVtc+GEwBLPtmH9MhS3mUWEWEfcReMz8oWKSKYiyNBUQYG4aLcn4ZfnJCWWVHps
EaPWjRgAc8TZi6KE69LA6h00gZ+6XKUNqKkY7pZhLEklzDt28GM1ToO1LHXgRjR9
acmRS8i3SzM70NA1Ip/lujoJzjwFlu28ARPrxbHZs3hPdCJxXuQrFo7EAL3+pfI8
7tMnfbK9bMpeGuLtIn9dYMUwyXg6b5vmsfSe7boULN2UO89+w0EboJfGfGc1dOHe
XnxL89C1Lb4tt++mDbXAVL/YUBE5T/v+f5CfwvzBCpwFB03rzhKGJCu01s8ossWZ
XijYcHzkP3WELn2+GN63tMUESVpH5+7/78E3eeQsd27L7ARs4ZA+WEIgmXcC28Qv
w1c2H3OETdDQ997ceSq0YPPiIehkZzPjsg4IbuNTvh2+K8wQSp5xDzGwXAW+XkdQ
RdBwO9al1V+UPUxiOhiR
=MEJt
-----END PGP SIGNATURE-----

--GMfQrbd2Hp2IBUu6FxPbGpC6VCvSJa4iP--
