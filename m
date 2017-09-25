From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the v4l-dvb tree
Date: Tue, 26 Sep 2017 09:09:57 +1000
Message-ID: <20170926090957.67fc493d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Markus Elfring <elfring@users.sourceforge.net>, Hans Verkuil <hansverk@cisco.com>
List-Id: linux-next.vger.kernel.org

Hi Mauro,

Commits

  9722e5696ca7 ("media: dvb-frontends: delete jump targets")
  af28c99628eb ("media: drivers: Adjust checks for null pointers")
  2d3da59ff163 ("media: drivers: improve a size determination")
  d303b7c5b266 ("media: drivers: delete unnecessary variable initialisations")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
