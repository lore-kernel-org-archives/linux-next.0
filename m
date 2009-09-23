From: Ken Lewis <kennylewis@gmail.com>
Subject: PATCH 0/1: rt2x00dev.c / rt2x00lib.h fixes build breakage
Date: Wed, 23 Sep 2009 21:58:35 +0100
Message-ID: <5a44caba0909231358y23f21c0drb2a3451084028a6f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

The headers in drivers/net/wireless/rt2x00/rt2x00lib.h don't match the
use of the function in rt2x00dev.c  The build fails as a result.

This has been a problem in linux-next since early September.  I've
e-mailed a patch to linux-next and to linux-net, but the 2.6.32 merge
window has brought the problem to the mainline and so I'm re-sending
my patch.  I've opened a bug on bugzilla:
http://bugzilla.kernel.org/show_bug.cgi?id=14217

Take care.
Ken
