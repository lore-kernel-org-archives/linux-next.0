From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma tree with the nfsd tree
Date: Sun, 3 Jan 2016 21:53:20 -0500
Message-ID: <5689DEA0.1020803@redhat.com>
References: <20151231133022.0b3ecab9@canb.auug.org.au>
 <20160104124450.7ba21c87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XDnDB3Xi3ElNKaTp55DVEjjjRo5SrO0gK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53294 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751974AbcADCx2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jan 2016 21:53:28 -0500
In-Reply-To: <20160104124450.7ba21c87@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Ira Weiny <ira.weiny@intel.com>, Or Gerlitz <ogerlitz@mellanox.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XDnDB3Xi3ElNKaTp55DVEjjjRo5SrO0gK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/03/2016 08:44 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> On Thu, 31 Dec 2015 13:30:22 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> Hi Doug,
>>
>> Today's linux-next merge of the rdma tree got conflicts in a quite a
>> few files between (mostly, I think) commit:
>>
>>   6c7b6d2d442c ("IB: merge struct ib_device_attr into struct ib_device=
")
>>
>> from the nfsd tree and various commits from the rdma tree.
>>
>> It would have taken me considerable time to fix the conflicts up, so I=

>> have dropped teh rdma tree for today (just because it was merged secon=
d).
>> Please have a conversation and figure out how you are going to coopera=
te
>> and get these conflicts fixed e.g. set up a stable branch with Christo=
ph's
>> commit (and any other conflicting commits) in it and merge that into
>> both trees.
>=20
> So, on further inspection, it appears that there is a series of commits=

> in the rdma tree that does basically the same as that nfsd tree commit
> above.  So I have dropped the rdma tree again today.  Please have a
> conversation guys ...
>=20

The initial patchset was Christoph's.  It was later replaced with a
different patchset from Or Gerlitz.  Bruce picked up some changes from
Chuck Lever that were originally based on Christoph's work but now need
to be rebased off of the current RDMA tree.

--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: 0E572FDD



--XDnDB3Xi3ElNKaTp55DVEjjjRo5SrO0gK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJWid6gAAoJELgmozMOVy/dZzwP/RRYR3MhGmic14112Be7xhfv
0ce+cGtsrTExfwVebR2tMSWxo9BFtudEgwmJDFjkQ7xDOcgVzzC8sWl+l6EeqP0h
evotkqYE52TBlt73oyqx/HN0qOowPGsXjQAaLuTVXQl4TEGWWJOQHP5A72u9qPd2
QVesTeoI+r5XEP9sR8ObztXRn3nOWJzzr0EIyJiPlRRLBFZyQJRaOuSYeWYvZyre
aMH/aglfmCJoGOBAdzAovBFowk+1jRd8q9A/LHACJa9wdWvjwcE++JB4J9DnmJPt
x7cq0D/t90KGaX4juyGYX09fr3FGSaUMSLVOe5ExaSsTDQabFIP+R1HSbEy0W0Bj
d8rqNHscTpL1XpD0GXnHOpPpUBsFksJd+XO3MYGBW+rSMhHsn6FMxGlRtghnnVjU
jOdh8Zm+qXkWp7UuesYJgD0DKfezh1h0bVdzOg5zFY0sZ0hYxZ/XhTCDJ2gfWl7w
VWTREJO5onWVvuXTEJlb/2ai0wCRBmCnhiWolICUQx6RUkAlgPiJKdgzhBX5pVkR
0akhLC0i7Hpan+V0jIzCmWfibTUtOOgpFhebDYb10FBhinODuRPRy4mha5sJl7fH
3lAFBpm+v6CbMU7LIYNZbXP+5cxEJE5WT4JxS8UMfqDQGcd8uINVRvM7Syeh6Ap9
ca4Ap/EaHJOsd1/qObRk
=RZxz
-----END PGP SIGNATURE-----

--XDnDB3Xi3ElNKaTp55DVEjjjRo5SrO0gK--
