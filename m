From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] udf: use ext2_find_next_bit
Date: Thu, 25 Feb 2010 23:29:14 +0900
Message-ID: <961aa3351002250629p11fc4a49m60aadbf79fc10696@mail.gmail.com>
References: <1266934273-9371-1-git-send-email-akinobu.mita@gmail.com>
	 <20100224162152.GK3687@quack.suse.cz>
	 <961aa3351002241738r7bbdc811p1fe80aabc336ae85@mail.gmail.com>
	 <10f740e81002250050g287f7753g96063376ecee9487@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f172.google.com ([209.85.221.172]:39167 "EHLO
	mail-qy0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932746Ab0BYOfE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2010 09:35:04 -0500
In-Reply-To: <10f740e81002250050g287f7753g96063376ecee9487@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>

2010/2/25 Geert Uytterhoeven <geert@linux-m68k.org>:
> On Thu, Feb 25, 2010 at 02:38, Akinobu Mita <akinobu.mita@gmail.com> wrote:
>> 2010/2/25 Jan Kara <jack@suse.cz>:
>>> On Tue 23-02-10 23:11:13, Akinobu Mita wrote:
>>>> Use ext2_find_next_bit (generic_find_next_le_bit) to find the set bit
>>>> in little endian bitmap region.
>
> Is any of this in linux-next now?
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/2208481/
> | fs/udf/balloc.c:274: error: implicit declaration of function
> 'generic_find_next_le_bit'

Yep, Jan's patch caused the build breakage.

Because generic_find_next_le_bit() is not available for all
archtectures. So we should use ext2_find_next_bit() here.
