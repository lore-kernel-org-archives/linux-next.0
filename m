From: Oliver Neukum <oliver@neukum.org>
Subject: Re: linux-next: USB mouse won't work after resume.
Date: Tue, 17 Feb 2009 11:35:11 +0100
Message-ID: <200902171135.13329.oliver@neukum.org>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au> <499A89AD.6010704@free.fr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out003.kontent.com ([81.88.40.217]:44462 "EHLO
	smtp-out003.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008AbZBQKd2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2009 05:33:28 -0500
In-Reply-To: <499A89AD.6010704@free.fr>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Laurent Riffard <laurent.riffard@free.fr>, linux-input@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>

Am Tuesday 17 February 2009 10:55:57 schrieb Laurent Riffard:
> My USB mouse won't work after suspend to disk and resume. I must unload and reload the ohci_hcd module to get it back.

Please recompile your kernel with CONFIG_USB_DEBUG and
send me your dmesg.

	Regards
		Oliver
