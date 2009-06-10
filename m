From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: next: voyager: sm/smp.h:205: error: 'smp_ops' undeclared
Date: Wed, 10 Jun 2009 15:48:22 +0400
Message-ID: <a4423d670906100448o161fb18am1868878c827376b5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:50368 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750948AbZFJLsV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Jun 2009 07:48:21 -0400
Received: by fxm9 with SMTP id 9so685226fxm.37
        for <linux-next@vger.kernel.org>; Wed, 10 Jun 2009 04:48:22 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>

Hi

arch/x86/include/asm/smp.h: In function 'hard_smp_processor_id':
arch/x86/include/asm/smp.h:205: error: 'smp_ops' undeclared (first use
in this function)

The code
static inline int hard_smp_processor_id(void)
{
        return smp_ops.hard_smp_processor_id();
}
should be under #ifdef CONFIG_SMP
