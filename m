From: David Vrabel <david.vrabel@csr.com>
Subject: Re: linux-next: uwb tree build failure
Date: Wed, 26 Aug 2009 12:51:38 +0100
Message-ID: <4A9521CA.80102@csr.com>
References: <20090826171054.631ad39c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cluster-g.mailcontrol.com ([208.87.233.190]:59547 "EHLO
	cluster-g.mailcontrol.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496AbZHZLx0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Aug 2009 07:53:26 -0400
In-Reply-To: <20090826171054.631ad39c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/uwb/reset.c: In function 'uwbd_msg_handle_reset':
> drivers/uwb/reset.c:334: error: implicit declaration of function 'msleep'
> 
> Caused by commit ffefcfffee9deb283ab278b0e142807cf0c18d61 ("uwb: avoid
> radio controller reset loops") from the uwb tree.

Should be fixed now.

David
-- 
David Vrabel, Senior Software Engineer, Drivers
CSR, Churchill House, Cambridge Business Park,  Tel: +44 (0)1223 692562
Cowley Road, Cambridge, CB4 0WZ                 http://www.csr.com/


'member of the CSR plc group of companies. CSR plc registered in England and Wales, registered number 4187346, registered office Churchill House, Cambridge Business Park, Cowley Road, Cambridge, CB4 0WZ, United Kingdom'
