From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next April 17: x86 allmodconfig drivers/ata failure
Date: Fri, 17 Apr 2009 12:16:02 +0530
Message-ID: <49E825AA.8000506@in.ibm.com>
References: <20090417120002.c47a686d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20090417120002.c47a686d.sfr@canb.auug.org.au>
Sender: linux-ide-owner@vger.kernel.org
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-ide@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's next allmodconfig (x86) build failed with

drivers/ata/pata_legacy.c: In function =91pdc_data_xfer_vlb=92:
drivers/ata/pata_legacy.c:289: error: =91ap=92 undeclared (first use in=
 this=20
function)
drivers/ata/pata_legacy.c:289: error: (Each undeclared identifier is=20
reported only once
drivers/ata/pata_legacy.c:289: error: for each function it appears in.)
drivers/ata/pata_legacy.c: At top level:
drivers/ata/pata_legacy.c:869: error: =91ATA_PFLAG_PIO32_CHANGE=92=20
undeclared here (not in a
+function)
make[2]: *** [drivers/ata/pata_legacy.o] Error 1
make[1]: *** [drivers/ata] Error 2

Thanks
-Sachin

--=20

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------

