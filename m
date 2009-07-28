From: Oliver Neukum <oliver@neukum.org>
Subject: Re: linux-next: manual merge of the ttydev tree with the usb.current tree
Date: Tue, 28 Jul 2009 14:10:40 +0200
Message-ID: <200907281410.41449.oliver@neukum.org>
References: <20090728140110.7cfe7c22.sfr@canb.auug.org.au> <20090728112608.09a494e0@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out003.kontent.com ([81.88.40.217]:54136 "EHLO
	smtp-out003.kontent.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753382AbZG1MKM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2009 08:10:12 -0400
In-Reply-To: <20090728112608.09a494e0@lxorguk.ukuu.org.uk>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

Am Dienstag, 28. Juli 2009 12:26:08 schrieb Alan Cox:
> On Tue, 28 Jul 2009 14:01:10 +1000
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Alan,
> >
> > Today's linux-next merge of the ttydev tree got a conflict in
> > drivers/usb/serial/usb-serial.c between commit
> > a00b8d98aca97bfb6fa983f41dae25b424058592 ("USB: fix usage count in usb
> > serial generic open regarding autoresume") from the usb.current tree	
>
> That looks wrong. The extra fiddling with port.count looks both unsafe
> and incorrect. I've never seen the "autoresume" patch referred to so I've
> no idea what it is trying to do

The problem is subdrivers looking at port->count to determine
whether URBs have to be resubmitted. That must happen once.
Therefore if serial_open() needs to do it itself it must make sure
resume() runs without port->count already incremented.

As serial_open() takes the lock, resume() must not do so.
If however, remote wakeup is used a lock must be taken
to look at port->count reliably. As this is impossible, the patch
implementing use of remote wakeup for the option driver
implements a private flag for opened ports.

This code from option_resume():

for (i = 0; i < serial->num_ports; i++) {
		/* walk all ports */
		port = serial->port[i];
		portdata = usb_get_serial_port_data(port);
		mutex_lock(&port->mutex);

		/* skip closed ports */
		if (!port->port.count) {
			mutex_unlock(&port->mutex);
			continue;
		}

		for (j = 0; j < N_IN_URB; j++) {
			urb = portdata->in_urbs[j];
			err = usb_submit_urb(urb, GFP_NOIO);
			if (err < 0) {
				mutex_unlock(&port->mutex);
				err("%s: Error %d for bulk URB %d",
					 __func__, err, i);
				return err;
			}
		}
		mutex_unlock(&port->mutex);

must not take the port->mutex.

Unfortunately I have no access to my trees today and yesterday.

	Regards
		Oliver
