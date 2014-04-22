From: Chris Ball <chris@printf.net>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Tue, 22 Apr 2014 12:10:00 +0100
Message-ID: <86r44ptybb.fsf@void.printf.net>
References: <20140422130655.51daec1807bde98ade65d691@canb.auug.org.au>
	<CAPDyKFqeEsDpamUksmgyEBhMN+xLih-Hv_bczbZv43m8ApHDvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:39059 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754432AbaDVLKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Apr 2014 07:10:07 -0400
In-Reply-To: <CAPDyKFqeEsDpamUksmgyEBhMN+xLih-Hv_bczbZv43m8ApHDvA@mail.gmail.com>
	(Ulf Hansson's message of "Tue, 22 Apr 2014 10:40:32 +0200")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>, Fariya Fatima <fariyaf@gmail.com>

Hi,

On Tue, Apr 22 2014, Ulf Hansson wrote:
> Until we work out the dependency issue caused by the above commit,
> could you please drop the following patches from your mmc-next
> branch!?
>
> df1a292 mmc: add support for HS400 mode of eMMC5.0
> f27a5d7 mmc: rework selection of bus speed mode
> e64f275 mmc: step power class after final selection of bus mode
> 6371adf mmc: identify available device type to select
> 3957848 mmc: drop the speed mode of card's state

Done, thanks.

- Chris.
-- 
Chris Ball   <http://printf.net/>
