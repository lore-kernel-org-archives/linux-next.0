From: David Miller <davem@davemloft.net>
Subject: Re: next-20090318: sunhme does not transmit packets
Date: Tue, 24 Mar 2009 13:23:55 -0700 (PDT)
Message-ID: <20090324.132355.234010341.davem@davemloft.net>
References: <a4423d670903240432m1a4e8e08x9c97a0947d89800a@mail.gmail.com>
	<a4423d670903240846j252a825cy1e8a50b5ac3a11ef@mail.gmail.com>
	<a4423d670903240850w223cdb74k7165ffd70cd7b357@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <a4423d670903240850w223cdb74k7165ffd70cd7b357@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: a.beregalov@gmail.com
Cc: roel.kluin@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-next@vger.kernel.org, kernel-testers@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Tue, 24 Mar 2009 18:50:55 +0300

> 2009/3/24 Alexander Beregalov <a.beregalov@gmail.com>:
> > e4a389a9b5c892446b5de2038bdc0cca8703c615 is first bad commit
> 
> No, it is wrong, sorry.
> I will do more tests tomorrow.

I bet it is the problem we are discussing here:

	http://marc.info/?l=linux-kernel&m=123789980524715&w=2

Herbert has posted two patches to try and fix this issue,
you can try the second one to see if it solves your bug
too.
