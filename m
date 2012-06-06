From: Chris Metcalf <cdmetcalf@comcast.net>
Subject: kisskb.ellerman.id.au email notifications?
Date: Wed, 06 Jun 2012 11:54:21 -0400
Message-ID: <4FCF7D2D.6030809@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qmta03.westchester.pa.mail.comcast.net ([76.96.62.32]:42827
	"EHLO qmta03.westchester.pa.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756178Ab2FFQAM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Jun 2012 12:00:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Stephen -

I noticed when I merged up to 3.4-rc1 that there were some build issues
with tilegx (I've pushed the fixes to my tree for linux-next).  Googling
around a little and referring to some earlier discussions, I realized that
http://kisskb.ellerman.id.au tracks the build successes and failures for
various branches and architectures, including tilegx on linux-next.

My question is whether there's a way to get email notification when a
particular build does fail.  I'd like to know when things break the tilegx
build, in between the times when I actually sync up and check it myself. 
Is there a mechanism for that, or should I stick with periodically checking
the website manually - which of course is much better than nothing! :-)

Thanks!
-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
