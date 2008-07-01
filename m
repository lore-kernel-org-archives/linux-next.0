From: Felipe Balbi <me@felipebalbi.com>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 01 Jul 2008 06:59:00 -0500
Message-ID: <d1df296985842ab0a986b05dd20ff3b7@felipebalbi.com>
References: <20080701215713.8796c966.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.siteground211.com ([209.62.36.12]:39575 "EHLO
	serv01.siteground211.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753750AbYGAL7I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 07:59:08 -0400
In-Reply-To: <20080701215713.8796c966.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org, Greg KH <greg@kroah.com>



On Tue, 1 Jul 2008 21:57:13 +1000, Stephen Rothwell <sfr@canb.auug.org.au>
wrote:
> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/ir-usb.c between commit
> 3128101cf92692e300fdb8bf66a9e8f286cbaa7f ("usb: irda: cleanup on ir-usb
> module") from the usb tree and commits
> ce8194a09dee5b7e101467aba6b7cd5617b1cd0f ("23-usb-serial-api-change") and
> ad58854921eeeab97a09600260ea03fa097394e4 ("48-tty-tidy-usb-ir-usb") from
> the ttydev tree.
> 
> I didn't even know where to start :-(, so I used the version from the
> ttydev tree (since the other is just a cleanup).

Greg, should i refresh the patch and resend ?

-- 
Best Regards,

Felipe Balbi
http://blog.felipebalbi.com
me@felipebalbi.com
