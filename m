From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [BUILD-FAILURE] linux-next: Tree for June 27 - randconfig build
 fails with !CONFIG_XFS_POSIX_ACL
Date: Sat, 28 Jun 2008 23:04:28 +0530
Message-ID: <48667624.1090904@linux.vnet.ibm.com>
References: <20080627182406.a54b00c1.sfr@canb.auug.org.au> <4865304C.3020301@linux.vnet.ibm.com> <20080628110518.5ae86cd6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP06.au.ibm.com ([202.81.18.175]:39100 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211AbYF1Rei (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 28 Jun 2008 13:34:38 -0400
In-Reply-To: <20080628110518.5ae86cd6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs-masters@oss.sgi.com, Andy Whitcroft <apw@shadowen.org>

Stephen Rothwell wrote:
> Hi Kamalesh.
>=20
> On Fri, 27 Jun 2008 23:54:12 +0530 Kamalesh Babulal <kamalesh@linux.v=
net.ibm.com> wrote:
>> randconfig build on x86_64 machine fails with build failure
>>
>>   CC [M]  fs/xfs/linux-2.6/xfs_xattr.o
>> fs/xfs/linux-2.6/xfs_xattr.c: In function =91xfs_decode_acl=92:
>> fs/xfs/linux-2.6/xfs_xattr.c:40: error: =91_ACL_TYPE_ACCESS=92 undec=
lared (first use in this function)
>> fs/xfs/linux-2.6/xfs_xattr.c:40: error: (Each undeclared identifier =
is reported only once
>> fs/xfs/linux-2.6/xfs_xattr.c:40: error: for each function it appears=
 in.)
>> fs/xfs/linux-2.6/xfs_xattr.c:42: error: =91_ACL_TYPE_DEFAULT=92 unde=
clared (first use in this function)
>=20
> Are you sure your sources are OK?  The patch "xfs fix 1" (which is th=
e
> second last commit in the next20080627 tree) is supposed to fix that.
>=20
Your right, the sources did not have the commit. Sorry for the noise.

--=20
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
