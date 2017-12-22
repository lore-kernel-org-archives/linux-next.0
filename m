From: Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Fri, 22 Dec 2017 08:32:03 +0800
Message-ID: <aac11853-d4fb-9308-8feb-b4686ca616c1@suse.com>
References: <20171220092010.36825688@canb.auug.org.au>
 <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
 <20171221164936.GN3553@suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CglmviNMDpIdKM2w9pSr1q5UTZC2Tmt3J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from prv3-mh.provo.novell.com ([137.65.250.26]:58583 "EHLO
        prv3-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752165AbdLVAcM (ORCPT
        <rfc822;groupwise-linux-next@vger.kernel.org:0:0>);
        Thu, 21 Dec 2017 19:32:12 -0500
In-Reply-To: <20171221164936.GN3553@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CglmviNMDpIdKM2w9pSr1q5UTZC2Tmt3J
Content-Type: multipart/mixed; boundary="A2MdNoGH8Eg7R2A1VMd3soeWIKPDzh0VG";
 protected-headers="v1"
From: Qu Wenruo <wqu@suse.com>
To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de
Message-ID: <aac11853-d4fb-9308-8feb-b4686ca616c1@suse.com>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
References: <20171220092010.36825688@canb.auug.org.au>
 <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
 <20171221164936.GN3553@suse.cz>
In-Reply-To: <20171221164936.GN3553@suse.cz>

--A2MdNoGH8Eg7R2A1VMd3soeWIKPDzh0VG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2017=E5=B9=B412=E6=9C=8822=E6=97=A5 00:49, David Sterba wrote:
> On Wed, Dec 20, 2017 at 08:12:11AM +0800, Qu Wenruo wrote:
>> On 2017=E5=B9=B412=E6=9C=8820=E6=97=A5 06:20, Stephen Rothwell wrote:
>>> After merging the btrfs-kdave tree, today's linux-next build (powerpc=

>>> ppc64_defconfig) produced this warning:
>>>
>>> fs/btrfs/qgroup.c: In function 'qgroup_reserve':
>>> fs/btrfs/qgroup.c:2432:1: warning: label 'retry' defined but not used=
 [-Wunused-label]
>>>  retry:
>>>  ^
>>>
>>> Introduced by commit
>>>
>>>   b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on gettin=
g EDQUOT"")
>>>
>> Sorry, I forgot to clean it up.
>>
>> I'll update the patchset along with new patches to handle qgroup limit=

>> better.
>=20
> Meanwhile I've applied the fix from Arnd to silence the warning in
> linux-next builds.
>=20

Some (not much, may be 2 or 3) patches is going to be updated:

btrfs: delayed-inode: Use new qgroup meta rsv for delayed inode and item
Revert "btrfs: qgroups: Retry after commit on getting EDQUOT" ( For the
lable)

And with 2 more new patches.

Do I need to resend the patchset or use separate patches for them?

Thanks,
Qu


--A2MdNoGH8Eg7R2A1VMd3soeWIKPDzh0VG--

--CglmviNMDpIdKM2w9pSr1q5UTZC2Tmt3J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFBBAEBCAArFiEELd9y5aWlW6idqkLhwj2R86El/qgFAlo8UoMNHHdxdUBzdXNl
LmNvbQAKCRDCPZHzoSX+qBKyB/0dpzL0V0mxevOh5F3PU4B0NBpXKexOWKNp7c6A
lS7JrKp0p8UkZ3i/NGac/TUdCmTNS8E6gMJYgA7CMmZ7k7hHyNNur9jBCh+m0pGe
iraucM/uM/oKsi84NgHMfLAoeCce+2N7PsXnKln9p6fZiH/xpjpoKAq8mqz7AR5w
KWxJRuUZuIBuUk+uWQE63gq8FUEhAZj1K34fbizJ/e+89bwf6+mD0VQeR9BTxORn
UzNpj2HorjzFWajE7ZktKEBJE7ga4oXXxY1OjlBcmBG0AX0RjcWMExauCaKT06Nk
jkp75SrPbQxu75RMukJx/CxzioArdP/9VD6Rne5SC27PhIHy
=ccrq
-----END PGP SIGNATURE-----

--CglmviNMDpIdKM2w9pSr1q5UTZC2Tmt3J--
