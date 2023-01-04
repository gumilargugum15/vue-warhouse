<html>
<head>
	<title>Receiving Product Report</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<style type="text/css">
		table tr td,
		table tr th{
			font-size: 9pt;
		}
	</style>
	<center>
		<h5>GOOD RECEIVE</h4>
		</center>
 
	<table class='table table-bordered'>
		<thead>
			<tr>
				<th>No</th>
				<th>Code</th>
				<th>Name</th>
				<th>Qty</th>
			</tr>
		</thead>
		<tbody>
			@php $i=1 @endphp
			@foreach($detail as $p)
			<tr>
				<td>{{ $i++ }}</td>
				<td>{{$p->code}}</td>
				<td>{{$p->name}}</td>
				<td>{{$p->qty}}</td>
			</tr>
			@endforeach
			<tr><td colspan="3">Total Item</td><td>{{$sum}}</td></tr>
		</tbody>
	</table>
 
</body>
</html>

