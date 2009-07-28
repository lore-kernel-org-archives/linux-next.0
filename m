From: Oliver Neukum <oliver@neukum.org>
Subject: Re: linux-next: manual merge of the ttydev tree with the usb.current tree
Date: Tue, 28 Jul 2009 21:21:32 +0200
Message-ID: <200907282121.33231.oliver@neukum.org>
References: <20090728140110.7cfe7c22.sfr@canb.auug.org.au> <20090728163222.GA14899@kroah.com> <20090728163420.GB14899@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out002.kontent.com ([81.88.40.216]:52895 "EHLO
	smtp-out002.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753199AbZG1TVQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2009 15:21:16 -0400
In-Reply-To: <20090728163420.GB14899@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Am Dienstag, 28. Juli 2009 18:34:20 schrieb Greg KH:
> > > Oliver: I'll send you an alternative patch later today/tomorrow that
> > > uses the ASYNC flags.
> >
> > Should I just drop Oliver's existing patch from my tree for now then?
>
> Ok, in order to get a good merge for today, I've dropped it now.
>
> Oliver, care to work with Alan to get something that is agreeable to
> everyone?

Sure. Alan, is there a driver you can recommend for looking at to learn how
to correctly use the tty layer?

	Regards
		Oliver
