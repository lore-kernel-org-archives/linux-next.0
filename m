From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v2] Staging: octeon: ethernet-tx: fixed coding style
 warnings, missing blank lines
Date: Wed, 8 Oct 2014 16:57:41 -0400
Message-ID: <5435A545.9040402@windriver.com>
References: <1412795924-17759-1-git-send-email-robertoxmed@gmail.com>
 <543592FD.9010900@windriver.com> <543594AF.4030507@gmail.com>
 <20141008205242.GA4606@drone.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20141008205242.GA4606@drone.musicnaut.iki.fi>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Roberto Medina <robertoxmed@gmail.com>
Cc: devel@driverdev.osuosl.org, josh@joshtripplet.org, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, ebiederm@xmission.com
List-Id: linux-next.vger.kernel.org

On 14-10-08 04:52 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Oct 08, 2014 at 09:46:55PM +0200, Roberto Medina wrote:
>> Thank you very much for your feedback. I just want to let you know that I
>> didn't ignore that annotation from the last patch. I actually added the
>> white line because checkpatch shows a warning there.
>>
>> WARNING: Missing a blank line after declarations
>> #553: FILE: drivers/staging/octeon/ethernet-tx.c:553:
>> +	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
>> +	if (unlikely(work == NULL)) {
>>
>> I don't see why I shouldn't insert a line there.
> 
> Maybe something like this would be more readable:
> 
>  	void *copy_location;
> +	cvmx_wqe_t *work;
>  
>  	/* Get a work queue entry */
> -	cvmx_wqe_t *work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
> +	work = cvmx_fpa_alloc(CVMX_FPA_WQE_POOL);
> 	if (unlikely(work == NULL)) {
> 
> Then declarations would be correctly separated from the code...

It probably wouldn't hurt -- what I failed to notice when giving
it a quick scan was that it was a clunky typedef in use to create
the variable declaration vs. a sane "struct blah_work *work = ...."
so yes, checkpatch was right in this case.

Paul.
--
> 
> A.
> 
