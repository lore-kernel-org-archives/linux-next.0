From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] rfcomm/sock: fix build problem
Date: Tue, 09 Dec 2008 04:44:24 -0800 (PST)
Message-ID: <20081209.044424.134557406.davem@davemloft.net>
References: <20081209123950.GA31294@orion>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081209123950.GA31294@orion>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mingo-X9Un+BFzKDI@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

From: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Tue, 9 Dec 2008 15:39:50 +0300

> net/bluetooth/rfcomm/sock.c: In function 'rfcomm_sock_ioctl':
> net/bluetooth/rfcomm/sock.c:795: error: 'sk' undeclared (first use in this function)
> net/bluetooth/rfcomm/sock.c:795: error: (Each undeclared identifier is reported only once
> net/bluetooth/rfcomm/sock.c:795: error: for each function it appears in.)
> 
> It is a conflict between a418b893
> (Bluetooth: Enable per-module dynamic debug messages)
> and 45555c0e
> (bluetooth: fix warning in net/bluetooth/rfcomm/sock.c)
> 
> Signed-off-by: Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Already fixed in net-next-2.6.

BTW, your patch reintroduces a warning.
