From: shuah <shuah@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the kselftest
 tree
Date: Tue, 27 Nov 2018 14:17:57 -0700
Message-ID: <6235956e-5edd-3b7d-1898-ab55094a7e16@kernel.org>
References: <20181128073603.3786e528@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128073603.3786e528@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Rue <dan.rue@linaro.org>, shuah@kernel.org
List-Id: linux-next.vger.kernel.org

On 11/27/18 1:36 PM, Stephen Rothwell wrote:
> Hi Shuah,
> 
> Commit
> 
>    623ea0df7083 ("selftests: firmware: remove use of non-standard diff -Z option")
> 
> is missing a Signed-off-by from its author.
> 

Thanks for catching this. I will fix it. This is the result of change 
log content messing up the commit: The diff -Z in the change log 
resulted in throwing out the Signed-off and Acked-by.

-----------------------------------------------------------------
diff -Z is used to trim the trailing whitespace when comparing the
loaded firmware file with the source firmware file. However, per the
comment in the source code, -Z should not be necessary. In testing, the
input and output files are identical.

Additionally, -Z is not a standard option and is not available in
environments such as busybox. When -Z is not supported, diff fails with
a usage error, which is suppressed, but then causes read_firmwares() to
exit with a false failure message.
--------------------------------------------------------------------

Oh well! I will fix-up the change-log and amend the commit.

thanks,
-- Shuah
