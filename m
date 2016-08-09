From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
Date: Tue, 9 Aug 2016 08:45:21 -0400
Message-ID: <4c965777-7466-cd43-a219-e39bf755ed0e@redhat.com>
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
 <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
 <CALq1K=JszAx8T1oUqhOoEFbHhh0pqWAi2oN-tMdgws2iXdsZeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="L54Ild2oeLMb9kkqVFRK3ciBw5mMk51ob"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38118 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932234AbcHIMpi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Aug 2016 08:45:38 -0400
In-Reply-To: <CALq1K=JszAx8T1oUqhOoEFbHhh0pqWAi2oN-tMdgws2iXdsZeQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>, Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--L54Ild2oeLMb9kkqVFRK3ciBw5mMk51ob
Content-Type: multipart/mixed; boundary="n8CwBlCo3p8p8uh1SL78hEs0E7iCRdaSx"
From: Doug Ledford <dledford@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Moni Shoua <monis@mellanox.com>, Kamal Heib <kamalh@mellanox.com>,
 Amir Vadai <amirv@mellanox.com>, Haggai Eran <haggaie@mellanox.com>
Message-ID: <4c965777-7466-cd43-a219-e39bf755ed0e@redhat.com>
Subject: Re: linux-next: build failure after merge of Linus' tree
References: <20160808115827.6dd7fa6f@canb.auug.org.au>
 <6a554a80-c3ed-1902-14d1-f1e03adbed49@redhat.com>
 <CALq1K=JszAx8T1oUqhOoEFbHhh0pqWAi2oN-tMdgws2iXdsZeQ@mail.gmail.com>
In-Reply-To: <CALq1K=JszAx8T1oUqhOoEFbHhh0pqWAi2oN-tMdgws2iXdsZeQ@mail.gmail.com>

--n8CwBlCo3p8p8uh1SL78hEs0E7iCRdaSx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/9/2016 4:54 AM, Leon Romanovsky wrote:
> On Mon, Aug 8, 2016 at 6:37 PM, Doug Ledford <dledford@redhat.com> wrot=
e:
>> On 8/7/2016 9:58 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> With Linus' tree, today's linux-next build (powerpc allyesconfig) fai=
led
>>> like this:
>>>
>>> drivers/infiniband/sw/built-in.o:(.opd+0x1698): multiple definition o=
f `copy_data'
>>> drivers/infiniband/hw/built-in.o:(.opd+0xe5f8): first defined here
>>> drivers/infiniband/sw/built-in.o:(.opd+0x1320): multiple definition o=
f `rxe_av_from_attr'
>>> drivers/infiniband/hw/built-in.o:(.opd+0xe280): first defined here
>>
>> This looks very suspicious.  I think you are picking up two copies of
>> the rxe code.  One from Linus tree and one from probably Leon's tree.
>> The thing is, the rxe driver is an entirely software RoCE driver.  So,=

>> after I picked it up, I moved it from drivers/infiniband/hw to
>> drivers/infiniband/sw where it more correctly belongs.  Leon's tree
>> doesn't have that move, and since you pull Leon's tree into your -next=

>> process, with the allyesconfig you are trying to build two copies of i=
t
>> and put them both statically into the kernel, hence all of the double
>> definitions.  Leon needs to drop his copy of the rxe driver and let th=
e
>> one in Linus' tree be the only one in existence.
>=20
> Doug,
> Just to be clear on this point and on my flow.
> I'm resetting my ->next branches on the same day of your email
> announcement of acceptance.

Ok, thanks for the clarification.  As it turned out, I needed to reset
my for-next tag.


--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: 0E572FDD


--n8CwBlCo3p8p8uh1SL78hEs0E7iCRdaSx--

--L54Ild2oeLMb9kkqVFRK3ciBw5mMk51ob
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJXqdBmAAoJELgmozMOVy/dpn4P/3zDO+0ay9SclSWNI0dw4RHN
FitNBUbRsThckj5aUonXIwiIS7sht0mo0pMgu9gNmuq8SPKdpwgw7tjray2iD/0L
5kb43AZYpIkJHPoklK3JSwuz4Pl+Kc636yG4mpo4Abyr1R8YOroO4XQFIF6BM3ow
V65OrTbQuMiF0k1URD/eokv6rsdF1fsJAaUBcWQXdq6OtrtA/1fOB7mOSb2sr6aG
Nrp/bpOOOgEA14FdkR54VnFQY93aUrc8X+WPyM48XPfpwRRSXcY/pgPr1O+DvrYN
BRdzeYyVMFf0taErm9uXV53SX5iwTH/af+eDhETbwpDOk+5mB+XV5xPmRt5ZrMwd
ZrmCKPuXb3IrbpbddY7hZQVPvW0yCZzBMOZPGn66Wp+NmFEuGiMnGvkb3qGHH4eg
pn7Z6jBa2H45DF8J3qXAkdkltFe8mxvobO13ua7fe5bQshIWAryXZMRutdenWnlN
Mq1BbnJRuxAGYoJ22c5dj80ms18C6QqmqLxLYS1RNmctQ/PR0ERV7p9BOlU8d0iL
pYeE1r6nbzhXLt0prXktaHUGEaqb2iuAkF7viTMujpkBkD7tVxfE7JD2jzj/Mi5B
tOcG63MgW3NPyJax0oBbppWZhvLDLyNM100Hugy9Vg0HArztFzO5V5Sx3Xux9c1z
GUvPnCXWpyKb3K/CrKvq
=9dh0
-----END PGP SIGNATURE-----

--L54Ild2oeLMb9kkqVFRK3ciBw5mMk51ob--
