From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: linux-next: manual merge of the ieee1394 tree with the  tree
Date: Fri, 06 Mar 2009 08:51:18 +0100
Message-ID: <49B0D5F6.7000106@s5r6.in-berlin.de>
References: <20090306142032.0442213d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from einhorn.in-berlin.de ([192.109.42.8]:56361 "EHLO
	einhorn.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755421AbZCFHvz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2009 02:51:55 -0500
In-Reply-To: <20090306142032.0442213d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux1394-devel@lists.sourceforge.net, linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Today's linux-next merge of the ieee1394 tree got a conflict in
> drivers/media/dvb/firewire/firedtv-avc.c between commit
> 154907957f9391b1af997b57507b16c018cc4995 ("firedtv: massive refactoring")
> from Linus' tree and commit 0435392b2594edeba33b2173326e73fdcd67bd50
> ("DVB: firedtv: fix printk format mismatch") from the ieee1394 tree.
> 
> I used the latter version.

Thanks.  I pushed this conflict resolution into linux1394-2.6.git too now.
-- 
Stefan Richter
-=====-==--= --== --==-
http://arcgraph.de/sr/
