From: Wim Van Sebroeck <wim@iguana.be>
Subject: Re: currently missing kernel devel trees
Date: Sun, 16 Oct 2011 23:11:02 +0200
Message-ID: <20111016211102.GA15720@infomag.iguana.be>
References: <20111013174358.b20fedb97c7b53db2ba82ff6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailrelay011.isp.belgacom.be ([195.238.6.178]:43859 "EHLO
	mailrelay011.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751188Ab1JPVM7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Oct 2011 17:12:59 -0400
Content-Disposition: inline
In-Reply-To: <20111013174358.b20fedb97c7b53db2ba82ff6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

Hi Stephen,

> With the mrege window approaching (sometime) I thought I would see how
> many of the 200 odd trees that are included in linux-next are actually
> currently inaccessible.  The list below (of 63 trees) is a couple of days
> out of date.  These are the trees that were hosted on git.kernel.org that
> have not popped up anywhere else (or, at least I have not been informed
> is they have) nor been resurrected on kernel.org.
> 
> Some of these may be no longer useful (please tell me).  Some may have no
> commits for v3.2.  But I bet that at leaset some do.
> 
...
> watchdog
...

Untill I have the time to do something new could you use the following tree and branch:

git://www.linux-watchdog.org/linux-watchdog.git linux-next

I started filling it with 5 patches allready, but still need to add some others in the next day.

Kind regards,
Wim.
