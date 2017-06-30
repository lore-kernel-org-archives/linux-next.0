From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 30 Jun 2017 14:00:54 +1000
Message-ID: <20170630140054.38f98968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Darren,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/platform/x86/sony-laptop.c: In function 'sony_laptop_setup_input':
drivers/platform/x86/sony-laptop.c:494:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-array-qualifiers]
  key_dev->keycode = &sony_laptop_input_keycode_map;
                   ^

Introduced by commit

  a0f0a5e1978b ("platform/x86: sony-laptop: constify few static structures")

-- 
Cheers,
Stephen Rothwell
