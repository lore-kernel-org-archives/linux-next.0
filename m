From: Qu Wenruo <wqu@suse.com>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
Date: Wed, 20 Dec 2017 08:12:11 +0800
Message-ID: <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
References: <20171220092010.36825688@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FW0gM5iY2VA3EO7y0beQx3wnTGXJLhYeh"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:43325 "EHLO
        prv3-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753375AbdLTAMU (ORCPT
        <rfc822;groupwise-linux-next@vger.kernel.org:0:0>);
        Tue, 19 Dec 2017 19:12:20 -0500
In-Reply-To: <20171220092010.36825688@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FW0gM5iY2VA3EO7y0beQx3wnTGXJLhYeh
Content-Type: multipart/mixed; boundary="eF8vhR0ADAM7iHLRGZx3vePXJE3oTgPU1";
 protected-headers="v1"
From: Qu Wenruo <wqu@suse.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Message-ID: <686908b0-29d9-b7af-18c3-619bebbcd87e@suse.com>
Subject: Re: linux-next: build warning after merge of the btrfs-kdave tree
References: <20171220092010.36825688@canb.auug.org.au>
In-Reply-To: <20171220092010.36825688@canb.auug.org.au>

--eF8vhR0ADAM7iHLRGZx3vePXJE3oTgPU1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2017=E5=B9=B412=E6=9C=8820=E6=97=A5 06:20, Stephen Rothwell wrote:
> Hi David,
>=20
> After merging the btrfs-kdave tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> fs/btrfs/qgroup.c: In function 'qgroup_reserve':
> fs/btrfs/qgroup.c:2432:1: warning: label 'retry' defined but not used [=
-Wunused-label]
>  retry:
>  ^
>=20
> Introduced by commit
>=20
>   b283738ab0ad ("Revert "btrfs: qgroups: Retry after commit on getting =
EDQUOT"")
>=20
Sorry, I forgot to clean it up.

I'll update the patchset along with new patches to handle qgroup limit
better.

Thanks,
Qu


--eF8vhR0ADAM7iHLRGZx3vePXJE3oTgPU1--

--FW0gM5iY2VA3EO7y0beQx3wnTGXJLhYeh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFBBAEBCAArFiEELd9y5aWlW6idqkLhwj2R86El/qgFAlo5qtwNHHdxdUBzdXNl
LmNvbQAKCRDCPZHzoSX+qL75B/96tu1+F8HrYh/bRpF+wA96+RN5b1McoqsPVPyB
wFWH+TZXYTYGl6pTPKOSrqsmg3N15wZoF75v+F14K5WqbwbQhWRtSD0Vjl0dIJpo
2RJV4J/KL0iMrCXuHGjpWxryTa+WgsCfvfZ7PCKnHqUISHOW+/ao+KG2fnuvuUrI
opWftN/Wl5TE9zuGg96WC0hhAg9vnIVTRXhgy+W7P0gcqk+JyefuMl43fANlaFBF
S8Z+q7UbdSWa4VpauznbjNfAQG2R2B1RA5ecV3B64R1PoG0PXDYB22Iqn7oIb9vQ
qQu1UVrtOPkruWtFVUnjSme6Z+CqSy9rPQij2eRUItA1n6di
=1lUo
-----END PGP SIGNATURE-----

--FW0gM5iY2VA3EO7y0beQx3wnTGXJLhYeh--
