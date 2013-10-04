From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 3
Date: Thu, 03 Oct 2013 22:23:39 -0700
Message-ID: <524E50DB.3060707@roeck-us.net>
References: <20131004010230.GI27287@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131004010230.GI27287@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: linux-next.vger.kernel.org

On 10/03/2013 06:02 PM, Mark Brown wrote:
> Hi all,
>
> Better late than never I've uploaded today's linux-next tree to the
> master branch of the repository below:
>
>          git://gitorious.org/thierryreding/linux-next.git
>
> A next-20131003 tag is also provided for convenience.
>
> A few new conflicts today caused by the removal of the h8300
> architecture which I didn't report for triviality.  Several new build
> failures were found as a result of running allmodconfig tests between
> merges all of which have been reported and I'm still carrying the i.MX
> fix that Thierry has been carrying.
>
> Due to the length of time taken to run all the allmodconfigs I skipped
> the defconfig tests; I know Olof has the ARM stuff covered in his
> autobuilder.  I'm going to use allyesconfig tomorrow since that should
> run faster so hopefully I can cover the ARM, i386 and x86_64 configs
> again.
>

I could try to set up the buildbot farm I am using for -stable candidates
to also test the -next tree. Would that help ?

Thanks,
Guenter
