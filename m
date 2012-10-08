From: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Fixes for ms_block
Date: Mon,  8 Oct 2012 17:36:20 +0200
Message-ID: <1349710582-5410-1-git-send-email-maximlevitsky@gmail.com>
References: <CAMuHMdW7zfM1CxkXTCq2=ErkaAAxGVFyQSZdH3jwvUXr_8oOsg@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:43325 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab2JHPgg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Oct 2012 11:36:36 -0400
In-Reply-To: <CAMuHMdW7zfM1CxkXTCq2=ErkaAAxGVFyQSZdH3jwvUXr_8oOsg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Alex Dubov <oakad@yahoo.com>, Linux-Next <linux-next@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>

Hi,

I finally found time to send the fix for the compile issue on m68k
Among with small cosmetic fix to remove unused field that slipped thorough.

Do you know if my driver will be merged in 3.7 or later?
I hope that the compile issue which I should have handled earlier is not to blame.
