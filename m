From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [Bisected] [-next-20130204] usb/hcd: irq 18: nobody cared
Date: Mon, 11 Feb 2013 11:25:48 +0100
Message-ID: <5118C72C.9060606@suse.cz>
References: <Pine.LNX.4.44L0.1302051520220.2245-100000@iolanthe.rowland.org> <1360466060.3703.15.camel@thor.lan> <1360506199.3461.5.camel@thor.lan> <CAE9FiQX0Jzqi=Dy=r3MoU9vK7HgAf+919LvbgLygW7VH3O4=bg@mail.gmail.com> <CAE9FiQX5wQ8zFzPfgmvm0BESyLVxzDRQ33XPgj+QjBZ0kxuHXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE9FiQX5wQ8zFzPfgmvm0BESyLVxzDRQ33XPgj+QjBZ0kxuHXg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinghai Lu <yinghai@kernel.org>, Peter Hurley <peter@hurleysoftware.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Lan Tianyu <tianyu.lan@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina <jkosina@suse.cz>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 02/11/2013 07:40 AM, Yinghai Lu wrote:
> Can you try attached debug patch?

FWIW this fixes it for me. No more 'derived' or 'nobody' in dmesg.

thanks,
-- 
js
suse labs
