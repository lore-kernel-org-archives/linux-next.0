From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Date: Mon, 02 May 2011 17:31:08 +0200
Message-ID: <4DBECE3C.5070008@suse.cz>
References: <20110502121817.645d544e.sfr@canb.auug.org.au> <20110502022417.GA11804@redhat.com> <20110502134524.40da4245.sfr@canb.auug.org.au> <20110502142454.a7091ad5.sfr@canb.auug.org.au> <20110502145338.7be2fdbc.sfr@canb.auug.org.au>            <20110502111337.GA15769@sepie.suse.cz> <10763.1304349435@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10763.1304349435@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Valdis.Kletnieks@vt.edu
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

On 2.5.2011 17:17, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 02 May 2011 13:13:37 +0200, Michal Marek said:
>
>> +# We test for support of the -Wunused-but-set-variable option, because
>> +# some version of gcc will happily accept any -Wno-* switch and complain
>> +# later during build.
>> +ifeq ($(call cc-option-yn, -Wunused-but-set-variable), y)
>> +KBUILD_CFLAGS += -Wno-unused-but-set-variable
>> +endif
>
> Do we need to do this more generically for all the other -Wno-foo
> options under the various W={123} options?

I only see -Wno-unused-parameter in scripts/Makefile.build and that 
should be supported by any gcc version. Also please have a look at 
http://marc.info/?l=linux-kernel&m=130433840412201&w=2, which is an 
updated version.

Michal
