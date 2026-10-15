const menu=document.querySelector('.menu'),nav=document.querySelector('nav');if(menu)menu.onclick=()=>{nav.style.display=nav.style.display==='flex'?'none':'flex'};document.querySelectorAll('.filters button').forEach(b=>b.onclick=()=>{document.querySelectorAll('.filters button').forEach(x=>x.classList.remove('active'));b.classList.add('active');const f=b.dataset.filter;document.querySelectorAll('.work').forEach(x=>x.hidden=f!=='all'&&!x.dataset.tags.split(' ').includes(f))});document.getElementById('year').textContent=new Date().getFullYear();
// Final navigation and filtering
document.querySelectorAll('.menu').forEach(button => button.addEventListener('click', () => {
  const nav = button.closest('.nav-wrap')?.querySelector('nav');
  if (!nav) return;
  const open = nav.classList.toggle('open');
  button.setAttribute('aria-expanded', String(open));
}));
document.querySelectorAll('.filters button').forEach(button => button.addEventListener('click', () => {
  const filter = button.dataset.filter || 'all';
  document.querySelectorAll('.filters button').forEach(item => item.classList.toggle('active', item === button));
  document.querySelectorAll('.work').forEach(card => {
    const tags = (card.dataset.tags || '').split(/\s+/);
    card.hidden = filter !== 'all' && !tags.includes(filter);
  });
}));
const year = document.getElementById('year');
if (year) year.textContent = String(new Date().getFullYear());
