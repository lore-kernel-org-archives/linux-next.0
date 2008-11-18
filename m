From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: Can you add the staging tree to -next?
Date: Tue, 18 Nov 2008 19:36:42 +0100
Message-ID: <49230B3A.2000509@s5r6.in-berlin.de>
References: <20081112235600.GA27554@kroah.com> <Pine.LNX.4.64.0811140825410.11953@anakin> <20081114173258.GC22980@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from einhorn.in-berlin.de ([192.109.42.8]:36583 "EHLO
	einhorn.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751935AbYKRShD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Nov 2008 13:37:03 -0500
In-Reply-To: <20081114173258.GC22980@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Greg KH wrote on November 14:
> On Fri, Nov 14, 2008 at 08:42:48AM +0100, Geert Uytterhoeven wrote:
>> Apart from the patches you receive against -next, is there any other
>> advantage, giving staging is disabled?
> 
> That is a huge advantage, don't discount it.  My staging tree has over
> 150 patches in it right now, and is quite diverged from what is in
> Linus's tree.  I have been getting the same patches sent over and over
> to fix the same thing that is already resolved in my tree, as the
> developers are working against -next thinking that they were working
> with the latest development tree.

These people are missing that -next is not a development tree.
(Unless final integration tests count still as development.)
-- 
Stefan Richter
-=====-==--- =-== =--=-
http://arcgraph.de/sr/
