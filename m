From: "Kyle Moffett" <kyle@moffetthome.net>
Subject: Re: Pull request for FS-Cache, including NFS patches
Date: Thu, 1 Jan 2009 13:40:06 -0500
Message-ID: <f73f7ab80901011040t4fe40625k95c1558581b10360@mail.gmail.com>
References: <1230679056.11508.37.camel@heimdal.trondhjem.org>
	 <7A24DF798E223B4C9864E8F92E8C93EC01BD14BB@SACMVEXC1-PRD.hq.netapp.com>
	 <20090101090900.551ada4a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rn-out-0910.google.com ([64.233.170.184]:15428 "EHLO
	rn-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbZAASkJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Jan 2009 13:40:09 -0500
In-Reply-To: <20090101090900.551ada4a@infradead.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@infradead.org>
Cc: "Muntz, Daniel" <Dan.Muntz@netapp.com>, Trond Myklebust <trond.myklebust@fys.uio.no>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Bernd Schubert <bernd.schubert@fastmail.fm>, nfsv4@linux-nfs.org, linux-kernel@vger.kernel.org, steved@redhat.com, dhowells@redhat.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, rwheeler@redhat.com

On Thu, Jan 1, 2009 at 3:09 AM, Arjan van de Ven <arjan@infradead.org> wrote:
> On Wed, 31 Dec 2008 20:11:13 -0800 "Muntz, Daniel" <Dan.Muntz@netapp.com> wrote:
>> If you're following the protocol, it doesn't even matter if a bad guy
>> ("untrusted user"?) gets root on the client--they still can't gain
>> inappropriate access to the file server.  OTOH, if my security plan is
>> simply to not allow root access to untrusted users, history says I'm
>> going to lose.
>
> if you have a user, history says you're going to lose.
>
> you can make your system as secure as you want, with physical access
> all bets are off.

Yeah... this is precisely the reason that the security-test-plan and
system-design-document for any really security sensitive system starts
with:

[  ]  The system is in a locked rack
[  ]  The rack is in a locked server room with detailed access logs
[  ]  The server room is in a locked and secured building with 24-hour
camera surveillance and armed guards

I've spent a little time looking into the security guarantees provided
by DAC and by the FS-Cache LSM hooks, and it is possible to reasonably
guarantee that no *REMOTE* user will be able to compromise the
contents of the cache using a combination of DAC (file permissions,
etc) and MAC (SELinux, etc) controls.  As previously mentioned, local
users (with physical hardware access) are an entirely different story.

As far as performance considerations for the merge... FS-cache on
flash-based storage also has very different performance tradeoffs from
traditional rotating media.  Specifically I have some sample 32GB
SATA-based flash media here with ~230Mbyte/sec sustained read and
~200Mbyte/sec sustained write and with a 75usec read latency.  It
doesn't take much link latency at all to completely dwarf that kind of
access time.

Cheers,
Kyle Moffett
