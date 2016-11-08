From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rtc tree
Date: Tue, 8 Nov 2016 17:41:52 +1100
Message-ID: <20161108174152.4a5620c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-next.vger.kernel.org

Hi Alexandre,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:


Caused by commit

  f9eb69d1ae2f ("rtc: jz4740: Add support for acting as the system power controller")

I have used the rtc tree from next-20161028 for today.

-- 
Cheers,
Stephen Rothwell
