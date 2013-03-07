From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: Tree for Mar 6 (hid)
Date: Thu, 7 Mar 2013 11:09:50 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1303071108150.28677@pobox.suse.cz>
References: <20130306115052.2b1969acb7b7a0fa35975984@canb.auug.org.au> <51379849.6040903@infradead.org> <CAN+gG=H4_1nUhhsUe031Q1QrnVna+F7hmAepe6kbNm=8z_gOjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <CAN+gG=H4_1nUhhsUe031Q1QrnVna+F7hmAepe6kbNm=8z_gOjw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 7 Mar 2013, Benjamin Tissoires wrote:

> > on i386 and x86_64:
> >
> 
> Sorry, it looks like my patches went not very smoothly.
> 
> > ERROR: "usb_control_msg" [drivers/hid/hid-multitouch.ko] undefined!
> 
> I've submitted a new patch removing this direct call. Maybe we should
> change the Kconfig while these patches are not applied. Jiri?

Benjamin,

which patch is that? The only hid-multitouch I still have in my queue is 
the hybrid finger/pen devices support, and I don't think it's fixing this 
problem.

Then I have one for logitech-dj which I still need to review, but I don't 
see anything else ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs
