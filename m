From: Eric Sandeen <sandeen@redhat.com>
Subject: Re: next-20090206: deadlock on ext4
Date: Fri, 06 Feb 2009 11:42:09 -0600
Message-ID: <498C7671.1050309@redhat.com>
References: <a4423d670902060935y59e540beta417144935416560@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46544 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753014AbZBFRmN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 12:42:13 -0500
In-Reply-To: <a4423d670902060935y59e540beta417144935416560@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Alexander Beregalov wrote:
> Hi
> 
> I run dbench on ext4 on loop device.
> 
> EXT4-fs: barriers enabled
> kjournald2 starting: pid 2420, dev loop0:8, commit interval 5 seconds
> EXT4 FS on loop0, internal journal on loop0:8
> EXT4-fs: delayed allocation enabled
> EXT4-fs: file extents enabled
> EXT4-fs: mballoc enabled
> EXT4-fs: mounted filesystem loop0 with ordered data mode
> JBD: barrier-based sync failed on loop0:8 - disabling barriers
> 
> INFO: task pdflush:2339 blocked for more than 120 seconds.

Looks a lot like a bug I filed:

http://bugzilla.kernel.org/show_bug.cgi?id=12579

but I'm having trouble reproducing it, now.  I'll try dbench!

-Eric
