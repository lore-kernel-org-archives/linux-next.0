From: Jim Davis <jim.epost@gmail.com>
Subject: make help error with next-20140331
Date: Mon, 31 Mar 2014 14:53:08 -0700
Message-ID: <CA+r1ZhhyxVeT5ABFj33fvvknUi9EHTq+16UcTqRss5JeP1vcJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: linux-next.vger.kernel.org

jim@doorstop:~/linux-next$ git describe
next-20140331
jim@doorstop:~/linux-next$ make help
Cleaning targets:
  clean		  - Remove most generated files but keep the config and
                    enough build support to build external modules
  mrproper	  - Remove all generated files + config + various backup files
  distclean	  - mrproper + remove editor backup and patch files

[ ... ]

Documentation targets:
/home/jim/linux-next/Documentation/DocBook/Makefile:19:
/media/Makefile: No such file or directory
make[1]: *** No rule to make target `/media/Makefile'.  Stop.
