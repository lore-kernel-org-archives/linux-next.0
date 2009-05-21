From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH 2/2] Staging: comedi: data.c should include delay.h
Date: Thu, 21 May 2009 17:08:28 +0400
Message-ID: <a4423d670905210608k25a92253j21fc231dd467bff2@mail.gmail.com>
References: <1242219648-16165-1-git-send-email-a.beregalov@gmail.com>
	 <1242219648-16165-2-git-send-email-a.beregalov@gmail.com>
	 <20090513132342.GA16280@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:35926 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319AbZEUNI1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2009 09:08:27 -0400
In-Reply-To: <20090513132342.GA16280@orion>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

2009/5/13 Alexander Beregalov <a.beregalov@gmail.com>:
> Fix this build error:
> .../data.c:86: error: implicit declaration of function 'udelay'
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---

Greg,
Please apply instead my another patch, which includes delay.h in comedidev.h.
