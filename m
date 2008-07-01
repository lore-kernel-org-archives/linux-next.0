From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 16:42:20 +0100
Message-ID: <20080701164220.18bba393@lxorguk.ukuu.org.uk>
References: <20080702000712.3698a7f9.sfr@canb.auug.org.au>
	<20080701151205.2b728f94@lxorguk.ukuu.org.uk>
	<20080701144330.GA32598@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:56618 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752612AbYGAQAC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 12:00:02 -0400
In-Reply-To: <20080701144330.GA32598@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

> When we discussed the removal of the driver we weren't able to find any 
> realistic chance that people both have this hardware and this kind of 
> wireless network.
> 
> What users do you know about?

The modems worked both with base stations but they also support working
as an adhoc star mode network and yes - people still use them for that in
interesting places where 802.11 doesn't work nicely. And I got bug
reports.. You can still plug em into a PC today and build ad-hoc star
networks including funky stuff like dual modem full dupex.

Of course if you'd bothered to discuss it anywhere I can find or read you
might have found that out earlier.

Alan
