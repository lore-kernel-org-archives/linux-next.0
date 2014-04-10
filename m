From: Ian Abbott <abbotti@mev.co.uk>
Subject: Re: [PATCH v2] staging: comedi: declare das6402_boards as static
Date: Thu, 10 Apr 2014 15:51:52 +0100
Message-ID: <5346B008.1030608@mev.co.uk>
References: <20140410135447.GA11137@powerline.azcom-win.it> <20140410143800.GA16928@powerline.azcom-win.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.mev.co.uk ([62.49.15.74]:48038 "EHLO mail.mev.co.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964877AbaDJOv6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Apr 2014 10:51:58 -0400
In-Reply-To: <20140410143800.GA16928@powerline.azcom-win.it>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michele Curti <michele.curti@gmail.com>, hsweeten@visionengravers.com, gregkh@linuxfoundation.org, chase.southwood@yahoo.com, devel@driverdev.osuosl.org, linux-next@vger.kernel.org

On 2014-04-10 15:38, Michele Curti wrote:
>
> das6402_boards array is used in das6402.c only, so declare it as static.
>
> Signed-off-by: Michele Curti <michele.curti@gmail.com>

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
