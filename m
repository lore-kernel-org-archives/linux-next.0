From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the ttydev tree
Date: Tue, 1 Jul 2008 15:16:30 +0100
Message-ID: <20080701151630.467112ac@lxorguk.ukuu.org.uk>
References: <20080702001234.6463753f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:34087 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754608AbYGAOeJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Jul 2008 10:34:09 -0400
In-Reply-To: <20080702001234.6463753f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Wed, 2 Jul 2008 00:12:34 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Alan,
> 
> Today's linux-next merge of the ttydev tree got a conflict in
> drivers/usb/serial/ti_fw_3410.h and drivers/usb/serial/ti_fw_5052.h
> between commit 01f845d09b8fdcdd27ee592422567b8dfa5b14d5
> ("ti_usb_3410_5052: use request_firmware()") from the firmware tree and
> commit ce8194a09dee5b7e101467aba6b7cd5617b1cd0f
> ("23-usb-serial-api-change") from the ttydev tree.
> 
> The former removed the files.

Relevant changes dropped from my tree
